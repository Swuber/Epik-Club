![swuber_3](https://cloud.githubusercontent.com/assets/11463275/25136927/4fd60eea-2424-11e7-989d-d6630c5b0827.png)

## Why two applications?
### built two ways to show two examples.
Why do people take pictures of the cards? 
are they worried that the progress will be lost?
or do they want to brag to other people?
Questions for me to ask not to decide. 

1) the application that is for everyone:
Benefits:
* Email used to ensure unique users.
* Application can be downloaded on any phone and people can brag about their Burger Report Card.
* Any user can view another user's card with routes or a search bar.
* Only admin are enabled to verify ... A burger has been consumed.
Negatives: 
* Do you really want another food application to clutter your phone?

2) the application that is not for everyone just employees:
Benefits: 
* Simple ... requested no email ... but may still do email.
* login could go two ways... click buttons to log specific people. 
But I think simpler all around just to put first name or initials.
* 
Negatives:
* Needs rethink when large enough for duplicates.
* possibly give them a unique number?

<hr>

# Implementation

On a mac: 
make sure homebrew is installed.
brew install elixir
```mix local.hex```
```mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez```
make sure postgress is installed via homebrew.
<pre>
brew install postgresql
brew services start postgresql
</pre>

Gather dependencies and start the server
<pre>
 mix deps.get
 mix ecto.create && mix ecto.migrate`
 npm install 
 
 mix phoenix.server
</pre>

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Epik Burger
