# Cis 3160 Assignment 2
* By Ian McKechnie
* Sunday, Nov 6th, 2022

## Hosted On
http://cis3260.socs.uoguelph.ca:33031/sign_up

## Game details:
1. Called 'Snake Eyes', the goal is to roll doubles (Name inspired from rolling doubles 1s with dice)

2. You first move the dice and coins to the cup by using the button 'Move to Cup'. 

3. Then you click the throw button.

4. Then the game tells you if you have and doubles and if so what they are,

5. It then automatically uploads the score to the current players points. Then saves them to the database and displays them on the screen.

## This application also includes,
A sign in Screen,
A log in screen,
A user screen,
A game screen


Note:
I could not figure out how to call different post methods inside the
controller files. I've tried 10 different solutions from online such
as the ones listed below but none of them work. please read the code 
inside the controller files to see that I have the logic for these 
games. I was missing one part and nobody I know even attempted the 
game so I had no one to ask for help. Please see that when you are 
marking me for the game component


<%= button_to '/moveToCup'%>

<%= form_tag moveToCup_url, method: :moveToCup do %>
    <%= submit_tag 'Move everything to cup REAL' %>
<% end %>


<%= button_to "Move everything to cup", 'moveToCup', method: :moveCup %>

<div>
    <%= form_with url: '/moveToCup' do |form| %>

        <div>
            What items would you like to move to the cup (leave blank for all)
        </div>
        <div class="mb-3">
            <%= form.label :description%>
            <%= form.text_field :description, placeholder: "colour: white" %>
        </div>

        <div class="mb-3">
            <%= form.submit "Move to cup"%>
        </div>

        <div>
            Description give = '<%= :description%>'
        </div>
    <% end %>
</div>