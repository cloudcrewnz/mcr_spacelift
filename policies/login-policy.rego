package spacelift

allow {
   input.session.login == "swapnil@cloudcrew.co.nz"
}
admin {
   input.session.login == "swapnil@cloudcrew.co.nz"
}
allow {
   input.session.login == "cloudplatform@cloudcrew.co.nz"
}
admin {
   input.session.login == "cloudplatform@cloudcrew.co.nz"
}
teams_config := { 
   "09edcd06-d0f3-4e34-90d5-655912cdd89a" : {
      "name":"",
      "spaces_read": {
         "cloud-platform-01J8GHP5BWH2C03C538QA4JS3M",
      },
      "spaces_write": {
         "cloud-platform-01J8GHP5BWH2C03C538QA4JS3M",
      },
      "spaces_admin": {
         "cloud-platform-01J8GHP5BWH2C03C538QA4JS3M",
      }      
   },

   "8058c305-af06-468f-b7ee-41d50794b7a2": {
      "name":"",
      "spaces_admin": {
         "core-services-01J9NMVCHW634S1WXTANX92VPN"
      }
   }
}

teams := input.session.teams

allow {
   teams_config[teams[_]]
}

space_read[space_id] {
   team := teams[_]
   team_spaces := teams_config[team]
   space_id = team_spaces.spaces_read[_]
}

space_write[space_id] {
   team := teams[_]
   team_spaces := teams_config[team]
   space_id = team_spaces.spaces_write[_]
}

space_admin[space_id] {
   team := teams[_]
   team_spaces := teams_config[team]
   space_id = team_spaces.spaces_admin[_]
}

deny  { not input.session.member }

sample := true
