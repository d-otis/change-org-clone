# Proposed Instance Methods
## Controllers
### Petition
```/petitions/new``` calls new petition form
```/petitions/:id/edit``` calls edit petition form
```/petitions``` calls petition index
- only petition_author can edit their petition
- can view petitions#index but cannot sign anything unless logged_in?
- can view petitions in a namespaced way under user id URL
- if author deletes petition it destroys dependents



## Models
### Petition
- should be able to call #signatures on an instance of Petition to get signer and anonymous boolean
- add draft/published boolean later on?

### User
- should be able to call #signatures and access which Petitions user has signed and if they were anonymous
- should be able to call total signatures and count how many times someone has signed things
- should only be able to sign something once
- should be able to change their signature to anonymous both during and after signing