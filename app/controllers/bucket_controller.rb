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
end
