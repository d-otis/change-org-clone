# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

foley = User.create(name: "Dan Foley", email: "dan@dan-foley.com")

foley.authored_petitions.create(title: "No To Zero For The Arts", description: "No To Zero for the Arts believes that a People’s Bail Out in Philadelphia *IS* an arts bailout. 

Unlike virtually every other major American city’s response to COVID-19, Philadelphia is proposing to raise taxes on working and middle-class people while also decimiating funding for the arts and culture sector as part of the 2021 budget – calling for the elimination of The Philadelphia Cultural Fund and The Office of Arts, Culture and Creative Economy (OACCE), which also provides considerable operating funds to The African American Museum in Philadelphia. Simultaneously, the State of Pennsylvania has rescinded all Pennsylvania Council on the Arts grants to arts and cultural organizations that had already been awarded. 

The stability of our arts and culture organizations are inextricably linked to the stability of the people of Philadelphia, who would be unduly burdened by tax-hikes and slashes to housing programs in the proposed austerity budget while corporations, real estate developers, and mega-nonprofits continue to receive major tax breaks and abatements!

Demand a Philly City Budget where #BlackLivesMatter! The proposed budget would increase Philadelphia Police Department funding by at least $14 million while cutting funding for public health, for education, for homeless services, for parks, and for arts and culture. We encourage you to reject that plan and donate to The Philadelphia Community Bail Fund!

If you are an artist, arts administrator or supporter of the arts in Philadelphia, we also encourage you to read, sign, and share the Open Letter on behalf of Philly Arts for Black Lives!

Nearly half of The Philadelphia Cultural Fund’s grant recipients operate on an annual budget of $150,000 or less. The defunding of The Philadelphia Cultural Fund will disproportionately affect small organizations, many of which are vital service organizations, caring for and attending to our most vulnerable populations, and are run by marginalized artists: people of color, women, and the LGBTQI+ community. These neighborhood-focused, grassroots, growing organizations often don’t qualify for private funding aimed at major institutions and largely depend on volunteer-labor and contributions from individuals in order to survive. If our artists, volunteers, members, and individual contributors are hurting, so are we! 

We believe there are other options for balancing the city’s budget, and Philadelphia’s City Controller does too! ", goal: 3000)

danny = User.create(name: "Danny Orendorff", email: "dan.orendorff@gmail.com")