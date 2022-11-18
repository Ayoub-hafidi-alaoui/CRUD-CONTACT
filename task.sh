#! /bin/bash

DATABASE=./database.txt


display_menu() {
	echo 
	echo "press i to add new contact"
	echo "press v to view all contacts"
	echo "press s to search for record"
	echo "press e to delete all contacts"
	echo "press q to exit"
	read input
}


# ask the user to choose between returning to the main menu or to exit

ask_user_again() {

	echo "press q to exit"
	read choice
	case $choice in 
		m | M)
			continue ;;
		q | Q)
			break ;; 
			
			
	esac

}


add_new_contact() {
	read -p "please enter your firstname: " firstname
	read -p "please enter your lastname: " lastname
	read -p "please enter your email: " email
	read -p "please enter your phone: " phone
	echo "firstname: $firstname: lastname: $lastname email: $email  phone: $phone" >> database.txt
	echo -e  "-------------------------------------------------------------------------------------------------\n" >> database.txt
	}


view_all_contacts() {
	
	if [ -f "database.txt" ]
	then
		for contact in $(less database.txt)
		do
			echo $contact
		done
	else
		echo "there is no contacts please insert new contacts"
	fi	
}

search_for_contact() {
	read -p "please enter any information about the contact: "  search
	if [ -f "database.txt" ]
	then
		echo $(cat $DATABASE)
		for contact in $(cat database.txt)
		do
			echo $contact | grep $search
		done
	else
		echo "there is no contacts please insert new contact"
	fi

}

delete_contact() {
	echo "hello from delete"
	echo $(rm database.txt  && touch database.txt)
}

while true
do
	display_menu

	case $input in
		i | I)
			add_new_contact;
			echo "press m to return to the main menu"
			echo "press q to exit"
			read choice
			case $choice in
				m|M)
					continue ;;
				q | Q)
					break ;;
			esac ;;
			 
		v | V)
			view_all_contacts ;
			echo "press m to return to the main menu"
			echo "press q to exit"
			read choice
			case $choice in 
				m | M)
					continue ;;
				q | Q)
					break ;;
			esac ;; 
		s | S)
			search_for_contact ;;
			echo "press m to retun to the main menu"
			echo "press q to exit"
			read $choice in 
				m | M)
					continue;;
				q | Q)
					break;;

		e |E)
			delete_contact;;
		q | Q)
			break ;;
	esac
done
echo "script finished"

