class Global < ActiveRecord::Base
  def self.counties
    ["Alachua","Baker","Bay","Bradford","Brevard","Broward","Calhoun","Charlotte",
    "Citrus","Clay","Collier","Columbia","DeSoto","Dixie","Duval","Escambia",
    "Franklin","Gadsden","Gilchrist","Glades","Gulf","Hamilton","Hardee",
    "Hendry","Hernando","Highlands","Hillsborough","Holmes","Indian River",
    "Jackson","Jefferson","Lafayette","Lake","Lee","Leon","Levy","Liberty",
	"Madison","Manatee","Marion","Martin","Miami-Dade","Monroe","Nassau",
	"Okaloosa","Okeechobee","Orange","Osceola","PalmBeach","Pasco","Pinellas",
	"Polk","Putnam","Santa Rosa","Sarasota","Seminole","St. Johns","St. Lucie",
	"Sumter","Suwannee","Taylor","Union","Volusia","Wakulla","Walton","Washington"]
  end
  
  def self.furniture
    ["Other","Bed","Camcorder","Camera","Chair","Chair","China Cabinet","Coffee Maker",
    "Coffee Table","Computer","Crib","Cup","Decoration","Desk","Dining Table",
    "Dishwasher","Dresser","Dryer","DVD","End Table","Flatware","Footboard",
    "Headboard","Lamp","Lawn Mower","Mattress","Microwave","Music Stereo",
    "Nightstand","Oven","Patio Chair","Patio Furniture","Patio Table",
    "Picture Frame","Plate","Pot/Pan","Printer","Recliner","Refrigerator",
    "Scanner","Sofa","Stove","Television","Toaster","Toaster Oven","VCR",
    "WallUnit/EntertainmentCenter","Washer"]
  end
  
  def self.monthly_expenses
    ["Rent","Mortgage","Mortgage w/ Taxes & Insurance","Property Taxes",
    "Homeowner's Insurance","Other Mortgage","Electricity/Gas","Transportation/Gas",
    "Water & Sewer","Recreation","Telephone","Cable","Internet", "Alarm/Security System",
    "Maintenance/Association","Home Maintenance","Food/Groceries","Clothing",
    "Laundry","Medical/Dental Expenses","School Supplies for Children","Life Insurance",
    "Health Insurance","Automobile Insurance","Car Payment","Boat Payment",
    "Child Support","Alimony","Haircuts/Beauty","Other"]
  end
end
