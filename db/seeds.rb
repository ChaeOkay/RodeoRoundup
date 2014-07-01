member_1 = { username: 'member1',
             first_name: 'Beatrix',
             last_name: 'Kiddo',
            }

member_2 = { username: 'member2',
             first_name: 'Felix',
             last_name: 'TheHousecat',
           }

organization_1 = { name: 'ATL',
                   address_1: '1 Peachtree',
                   city: 'Atlanta',
                   state: 'GA',
                   zip: '30309',
                   phone: '000-000-00000',
                 }

organization_2 = { name: 'NYC',
                   address_1: '100 Broadway',
                   city: 'New York',
                   state: 'NY',
                   zip: '10007',
                   phone: '111-111-1111',
                 }

organization_3 = { name: 'MI',
                   address_1: '1010 Saginaw',
                   city: 'Lansing',
                   state: 'MI',
                   zip: '48917',
                   phone: '222-222-2222',
                 }

ActiveRecord::Base.transaction do
  m1 = Member.create(member_1)
  m1.organizations.create(organization_1)
  m1.organizations.create(organization_2)

  m2 = Member.create(member_2)
  m2.organizations.create(organization_3)
end

