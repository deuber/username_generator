
    # * John Doe 1978 --> jdoe78_1
    # * John Doe 1978 --> jdoe78_2
    # * John Doe 1978 1 --> seller-jdoe78_1
    # * John Doe 1978 2 --> manager-jdoe78_1
    # * John Doe 1978 3 --> admin-jdoe78_1


# 1. create a unary function `generate_username1` that accepts a users's first name
#     * return only the first character
#     * make it lowercase

def generate_username1(firstname)
	firstname[0].downcase
end



# 2. create a binary function `generate_username2` that accepts a user's first and last name
#     * return the first char of the first name + the last name
#     * make it lowercase
#     * remove leading and trailing spaces
#     * reject invalid input: e.g. cases like ""
#     * STRETCH: ensure that only alphabet characters are allowed

def generate_username2(firstname, lastname)
    firstname.gsub!(/[!@%&"0-9\-]/,'')
    lastname.gsub!(/[!@%&"0-9\-]/,'')
	if firstname == ""
		p nil
	elsif lastname == ""
		p nil
	else
	firstname.strip!
	lastname.strip!
	name = firstname.downcase[0]+lastname.downcase
	end
end

    
# 3. create a function `generate_username3` that takes three arguments: first_name, last_name and birth_year
#     * combine them into one string, e.g. "smith1980"
#     * use only the last two digits of birth_year
#     * reject invalid birth_year input: e.g. cases like 80, 198, 20111



def generate_username3(firstname,lastname,birth_year)
	if birth_year.to_s.length == 4
		generate_username2(firstname,lastname) + birth_year.to_s[2..-1]
	else
		nil
	end

end


# 4. Privilege levels `check_privilege` --> GOAL: "seller-jdoe78", "admin-xkcd78"
#     * Create a function that allocates privileges according to the following table:
#         * 0 --> "user"
#         * 1 --> "seller"
#         * 2 --> "manager"
#         * 3 --> "admin"
#     * return a string indicating the corresponding privilege level
#     * make the privilege level 0 by default
#     * STRETCH: modify your function to `generate_username4` and have it create accounts that specify user privileges
#         * prefix usernames with e.g. "admin-", "seller-" --> "seller-jdoe78"
#         * However do not add any prefix for normal users.

 #generate_username4("john", "doe", 1945, 1) ).to eq "seller-jdoe45"

def check_privilege(key=0)
	table = {0=>"user", 1=>"seller", 2=>"manager", 3=>"admin"}
	table[key]
end


def generate_username4(firstname,lastname,birth_year, privilege=0)
	if privilege > 0
		check_privilege(privilege)+"-"+generate_username3(firstname,lastname,birth_year)
	else
		generate_username3(firstname,lastname,birth_year) 
	end
end


  
# 5. ensure username uniqueness `generate_username5`
#     * save your usernames as you create them --> (think about how you want to store them)
#     * if a username already exists, append "_1"
#         * STRETCH: increment n: e.g.  jdoe78, jdoe78_1,  jdoe78_2, bbunny60, bbunny60_1

def generate_username5(firstname,lastname,birth_year, privilege=0)
	


