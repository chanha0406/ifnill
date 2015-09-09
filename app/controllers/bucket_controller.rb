class BucketController < ApplicationController

    before_action :authenticate_user!, only:[:make_bucket]

    def projectList
    end
    
    def firstProcessList
    end
    
    def secondProcessList
    end
    
    def finalProcessList
    end

    def make_bucket	


    end

    def create_bucket

        bucket=Bucket.new
        bucket.f_user_id=current_user.id
        bucket.name=params[:name]
        bucket.intro_simple=params[:intro_simple]
        bucket.intro_detail=params[:intro_detail]

        bucket.start_date=convert_date(params[:start_date])
        bucket.finish_date=convert_date(params[:finish_date])

        bucket.save

        redirect_to '/'

    end

    def convert_date (arg0)

        date=""
        date_array=arg0.split('/')
        date_array.insert(0,date_array.pop)

        date_array.each do |x|
            date << x
            if date.length!=10
                date << '-'
            end
        end

        return date

    end

end
