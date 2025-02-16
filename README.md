# FetchRecipes

### Summary: Include screen shots or a video of your app highlighting its features
<img width="546" alt="Screenshot 2025-02-16 at 3 41 20 PM" src="https://github.com/user-attachments/assets/a396e4e2-5083-4cea-9e17-638233b65fb8" />

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
Given the requirements wanted a single screen only, I did not create a master-detail style interface (or a NavigationSplitView), instead I simply created a list of the recipes pulled from the endpoint.  If I was to continue improving it, I would likely have (as I originally considered) using swift data to store the recipes, then created a sepatate cuisine type to allow the cuisines to be dynamically created based on the data incoming, but the requirements did not ask for persistence (other than caching).  My theory was that the cuisine objects could then easily be used for filtering with tags at the top for each different cuisine, allowing the user to tap favorite cuisines and see only the matching recipes.  I could have done this with the strings of course, but in any real app, we'd want to have the data protected to avoid a potential maintance issue.  An enum would be another option, but of courser the addition of another cuisine would require a new build of the app, rather than dynamically updating.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
Initially I focused on the data, modeling it, and ensuring that I could access it and decode the data.  After that a list with a simple UI was pretty straightforward.  
The next area of focus was the caching, but I ended up spending more time researching that than expected, as I had limited time this week available for this.  I was hoping to find a solution that did not require me to convert the image data to a UIImage, but other than relying on the built in session based caching, that did not seem as easy as I expected, so I did convert the data to a UIImage then use that to create a swiftUI Image.
Overall, scattered over the course of the week, including too much time going down the rabbit hole a bit on the caching mechanism, I probably spent maybe 8 hrs.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
I relied on the previews to test the swiftui views, and could have done more extensive testing.  My tests were mostly focused on the data.  If I was doing true TDD, everything shouyld be tested, and everything should start with a test, but unfortunately, I was not able to dedicate the time this week.

### Weakest Part of the Project: What do you think is the weakest part of your project?
Testing should be more exhaustive, and better organized.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
This was my first use of swift testing, instead of XCTest, and I could have created separate test suites and better organized tests.  I was thinking like someone who uses xctest, and not someone who uses swift's Testing framework.
