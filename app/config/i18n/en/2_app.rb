# All app-specific translations, or overrides of Brut's defaults, go here.
{
  # en: must be the first entry, thus indicating this is the EN translations
  en: {
    cv: {
      cs: {
      },
      ss: {
        email_taken: "This email has been taken",
        not_enough_words: "%{field} does not have enough words. Must have %{num_words}",
      },
    },
    pages: { # Page-specific messages - this key is relied-upon by Brut to exist
      "BlogPostEditorPage": {
        title: "Blog post editor page",
        form: {
          title: "Title",
          content: "Post content",
          post: "Post it!",
        },

      },
      HomePage: {
        title: "Welcome!",
      }
    },
    components: { # Component-specific messages - this key is relied-upon by Brut to exist
    },
    clis: { # Messages used in CLIs - this key is relied-upon by Brut to exist
    },
    hello: "Hello, and welcome to Brut!",
    # Other keys can go here and you can organize them however you like.
  },
}
