# rails new Backoffice

rails generate scaffold WineColor name:string

rails generate scaffold WineMaker name:string

rails generate scaffold User username:string:uniq first_name:string last_name:string password:string email:string:uniq last_login:datetime date_joined:datetime is_superuser:boolean is_staff:boolean

rails generate scaffold Wine name:string description:text wine_color:references vintage:integer wine_maker:references country:string region:string appellation:string price:decimal

rails generate scaffold Review name:string description:text stars:integer createdAt:datetime lastEdit:datetime user:references wine:references

rails generate scaffold Comment content:text createdAt:datetime lastEdit:datetime user:references wine:references
