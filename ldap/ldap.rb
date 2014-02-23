require 'net/ldap' # gem install net-ldap

puts "test"

def name_for_login( netid, password )
    ldap = Net::LDAP.new(
        host: 'ldap.rutgers.edu',    # Thankfully this is a standard name
        auth: { method: :simple, netid: netid, password:password }
    )
    if ldap.bind
        # Yay, the login credentials were valid!
        # Get the user's full name and return it
        ldap.search(
            base:         "DC=rutgers,DC=edu",
            filter:       Net::LDAP::Filter.eq( "mail", email ),
            attributes:   %w[ displayName ],
            return_result:true
        ).first.displayName.first
    else
        puts "failed"
    end
end

name_for_login('krp103', 'Nosesaregreen2')
