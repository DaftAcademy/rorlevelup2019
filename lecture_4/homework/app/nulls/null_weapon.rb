class NullWeapon

    def initialize(pref_kind)
        @kind= pref_kind
    end
  
    def type        
            "no weapon"     
    end
   
    def range 
         0
    end

    def damage 
         0
    end
    
    def kind 
       @kind
    end

    def calculate_damage
        0
    end
end 