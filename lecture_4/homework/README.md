# List of changes
### Create nulls folder

    create NullMercenary
        name set to "not a mercenary"
        all variables set to 0 

    create NullWeapon
        if we don't give them any weapon, they will not be able to fight, so damage and distance are set to 0
        weapon kind is set accordingly to warrior preferences to avoid future problems 


### Create MercenarySerializer

    Instead of making another null object for warriors I've just checked if object is not nil, what gives satisfying output
       object.warrior.nil? ?  nil : WarriorSerializer.new(object.warrior)


### Update Warrior model

    add  dependent nullify to mercenary foreign key, so now mercenaries can be dismissed and hired again
        has_one :mercenary, dependent: :nullify

    add nulObject handlers
        def mercenary
            super || NullMercenary.new
        end
        def weapon
            super || NullWeapon.new(preferred_weapon_kind) 
        end


### Create MercenaryQuery

    improve queries in MercenaryController

        Create methods:
            not_hired_by_others - select all mercenaries in relation where warrior_id is NULL
            free_at_now - select all mercenaries in relation where available_from is in the past
            best - select one mercenary in relation, which have the highest experience and is possibly cheap

         
### Create MercenaryHelper  

    enclosed all advanced methods mercenaries in helper to improove code's clarity

        Create methods:
            addToArmy -         take mercenary, clan and building, triggers method accommodate, assignClass, assignClan and save new wrarrior
            accommodate -       assign new warrior to building
            assignClan -        assign new warrior to clan
            assignClass -       assign new warrior to proper class depending on mercenary's preferred_weapon_kind attribute (melee - Samurai, other - Husar)
            setContract -       changes available_from mercenary's atribute (as default 10 days to mantain backward compatibility)
                                    (if we hire him, he will not be available from now till end of contract)
            create_good_weapon -it wasn't changed, (except change variable into hash) just moved from MercenariesController. 
                                    I didn't add any default weapon, because third option is magical and it should be handled best by NullWeapon


### Update MercenariesController

    clearer, bug fixed and use queries and helper

    Methods:
        index -         use queries 
                        delete .all at the end
                        uses serializer

        show -          uses serializer 
                        remove include: (inclusion is applied in serializer)

        employ -        split responsibilities to other methods
                        additionally check if mercenary is still in army (even if conract expired he should be unavailable till corresponding warrior object exist)
                        uses prepare method on mercenary
        
        employ_best -   uses queries
                        add option to exit method if there are no available mercenaries
                        uses prepare method on mercenary 

        prepare -       uses addToArmy from MercenaryHelper on mercenary with building provided by find_building and clan provided by find_clan
                        uses setContract from MercenaryHelper on mercenary with contract_len
                        uses create_good_weapon from MercenaryHelper on mercenary
                        save mercenary with changes. If something goes wrong the corresponding warrior is destroying
        
        find_clan -     delete else statement (assign mercenary to random clan is pretty bad idea)



