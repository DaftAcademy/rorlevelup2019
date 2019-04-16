module Reports
    class SiegeReportSerializer

        def initialize(siege_report)
            @food_required = siege_report.food_required
            @siege_days = siege_report.siege_days
        end

        def serialized_json
            return {
                "data": [{
                    "type": "siege_report",
                    "attributes": {
                        "food_required": @food_required,
                        "siege_days": @siege_days
                    },
                }]
            }.to_json
        end
    end
end