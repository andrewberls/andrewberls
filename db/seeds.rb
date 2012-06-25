POST_MAILCHECK = %Q{
<p>
I recently stumbled across <a href="https://github.com/kicksend/mailcheck">mailcheck.js</a>, a little jQuery plugin from <a href="http://kicksend.com/">Kicksend</a> that suggests domains based on common typos in email forms. For example, 'user@gnail.co' will generate a suggestion for 'user@gmail.com'. It's perfect for preventing errors in user signups, and the authors claim its reduced their email bounces by 50%. After playing around with it, I've decided to bundle it into production for most, if not all of my projects, and this is just a brief demo of what can be done with it.
</p>

<h3>Getting Set Up</h3>
<p>
Our goal is to create a simple display that shows email suggestions to the user and offers a way to automatically fill in the field with the suggestion. If you want to play with the end result before we dive into the details, I have a simple demo set up <a href="http://andrewberls.com/demos/mailcheck.html">here</a>.

The plugin is used in two steps - first, it has to be attached to a text field, and then you have to actually do something with its suggestions. Let's get the basic JavaScript structure set up (make sure you include the actual plugin on your page as well!)
</p>

<pre>
<span class="comment">&lt;!-- The HTML --&gt;</span>
&lt;input id=&quot;email&quot; type=&quot;text&quot; placeholder=&quot;Email&quot;&gt;
&lt;div id=&quot;hint&quot;&gt;&lt;/div&gt;


<span class="comment">// The JavaScript</span>
var $email = $('#email'); <span class="comment">// Cache jQuery objects into variables</span>
var $hint = $("#hint");

$email.on('blur', function() {
  $(this).mailcheck({
    suggested: function(element, suggestion) {

    }
  });
});
</pre>

<p>
The setup is only a few lines, although it's important to understand what's going on. Our HTML is fairly straightforward - we start with a generic input that we'll be using the plugin on. The <code>&lt;div id=&quot;hint&quot;&gt;</code> is an initially hidden div that will contain our suggestions to the user. In our JavaScript, we're first sticking jQuery objects into variables for convenience. Then we're attaching the <code>mailcheck()</code> function to our email field on its blur event, which is called whenever the element loses focus (i.e., the user moves on to the next field). Mailcheck takes two callbacks, <code>suggested()</code> and <code>empty()</code>. <code>suggested()</code> is called whenever a suggestion is available for the field, and <code>empty()</code> whenever the field is left blank. We'll only be using <code>suggested()</code> in this demo, although depending on how you use the plugin it's generally a good idea to use both.
</p>

<break />

<h3>Using the suggestion object</h3>
<p>
Mailcheck automatically generates our field suggestions for us, but how do we use them? Note that the <code>suggested()</code> method from before is passed in two parameters - <code>element</code>, which is the field that we're checking, and something called <code>suggestion</code>. If you enter user@gnail.co and use your favorite tool to inspect it, you'll notice it's an object with three fields:
</p>

<img src="/images/posts/mailcheck_object.png" alt="The mailcheck suggestion object">

<p>
We have access to the address (what comes before the @), the suggested domain, and the entire suggested text. We can use these fields to populate and show a hint to the user using the previously mentioned <code>&lt;div id=&quot;hint&quot;&gt;</code>. Here's how you could go about filling the hint element:
</p>

<pre>
var $email = $('#email');
var $hint = $("#hint");

$email.on('blur',function() {
  $hint.css('display', 'none'); <span class="comment">// Hide the hint</span>
  $(this).mailcheck({
    suggested: function(element, suggestion) {
      if(!$hint.html()) {
        <span class="comment">// First error - fill in/show entire hint element</span>
        var suggestion = &quot;Yikes! Did you mean &lt;span class='suggestion'&gt;&quot; +
                          &quot;&lt;span class='address'&gt;&quot; + suggestion.address + &quot;&lt;/span&gt;&quot;
                          + &quot;@&lt;a href='#' class='domain'&gt;&quot; + suggestion.domain + 
                          &quot;&lt;/a&gt;&lt;/span&gt;?&quot;;
                          
        $hint.html(suggestion).fadeIn(150);
      } else {
        <span class="comment">// Subsequent errors</span>
        $(".address").html(suggestion.address);
        $(".domain").html(suggestion.domain);
      }
    }
  });
});
</pre>

<p>
Before we do anything with the suggestion, we're making sure to hide the hint element. If there's a suggestion, we'll be repopulating it with the suggested domain, but this handles the case that a valid email is entered after we've already suggested a hint. At the beginning of the <code>suggested()</code> callback, we're checking to see if the hint element is empty (<code>if (!$hint.html()) {...}</code>). If so, then we can assume it's the user's first error. The suggestion variable is a rather nasty string of HTML that we'll be inserting into the hint element. There are other ways of doing this such as template systems or DOM libraries, but this is a quick and dirty solution. On the first error, we first fill in the hint with our suggestion (<code>$hint.html(suggestion)</code>) and fade it in by chaining it to jQuery's <a href="http://api.jquery.com/fadeIn/">fadeIn</a> method. On subsequent errors, instead of fading in the hint, all we have to do is modify its contents to reflect the new contents of the field. At this point, we should have a working hint!
</p>

<img src="/images/posts/mailcheck_suggestion.png" alt="Email suggestion to the user">

<p>
At this point, we're missing the last piece of the puzzle - I've styled the domain to look like an inviting link, but clicking it doesn't actually do anything. It should be a link automatically fill in the suggestion for you - let's implement it!
</p>

<pre>
<span class="label">// After our other code:</span>
$hint.on('click', '.domain', function() {
  <span class="comment">// On click, fill in the field with the suggestion and remove the hint</span>
  $email.val($(".suggestion").text());
  $hint.fadeOut(200, function() {
    $(this).empty();
  });
  return false;
});
</pre>

<p>
The code is much shorter for this bit - we're using jQuery's <a href="http://api.jquery.com/on/">on()</a> method to attach a click handler to the <code>.domain</code> link. All we're doing is filling in the field with the suggestion text, and fading out the hint, emptying it when it's complete. And that's it! We have a fully functional hint element that displays suggestions to the user and provides a link to automatically fill the suggestion into the field. Be sure to check out the working example <a href="http://andrewberls.com/demos/mailcheck.html">here</a>!
</p>
}

POST_CHEEKY = %Q{
<p>
<strong>Mobile development doesn't have to be hard.</strong> That's why I created my latest project - Cheeky.css, a grid system that makes building responsive sites a breeze. It's more important than ever to create mobile-friendly sites, but defining a separate version or stylesheet just for handhelds is a pain. With Cheeky, you only have to style your page once, and your content will automatically scale to fit the browser width.
</p>


<h3>Using Cheeky</h3>
<p>
If you've used any grid before, the syntax will be very familiar. Cheeky is based off an 1100px grid with 16 columns contained in rows. 16 is an arbitrary number, but combined with familiar column offsets, you have the freedom to structure your content exactly how you like. To get started, everything is unsurprisingly contained in a <code>&lt;div class=&quot;container&quot;&gt;</code>. From there, you lay out your columns inside a <code>&lt;div class=&quot;row&quot;&gt;</code>, 16 to a row. Columns are defined using the syntax <code>&lt;div class=&quot;span-#&quot;&gt;</code>, where # is any number between 1 and 16. Offsets are almost identical - just toss on a <code>class=&quot;offset-#&quot;</code>, except that you can only offset up to 15. Let's take a look at the bare minimum example:
</p>

<break />

<pre>
&lt;div class=&quot;container&quot;&gt;
  &lt;div class=&quot;row&quot;&gt;
    &lt;div class=&quot;span-8&quot;&gt;This is 8 columns&lt;/div&gt;
    &lt;div class=&quot;span-4 offset-4&quot;&gt;This is 4 columns, offset by 4!&lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

<p>
That's all there is to it! Once you get used to working with spans and offsets, structuring your content is easy and Cheeky does all the work for you. Nested columns are totally possible as well - just stick in another row and structure nested content the same way. You can find more usage information and downloads <a href="http://andrewberls.github.com/Cheeky/">here</a>!
</p>


<h3>Details</h3>
<p>
As mentioned before, Cheeky's base is an 1100px grid for desktop screens. Once the browser is resized, CSS media queries are used to progressively scale the grid down to 790px and 630px (In the code, these two states are listed as 'small' and 'tiny' grids). Past that point (portrait phones and below), Cheeky reverts to displaying columns stacked on top of each other. Cheeky is built with Sass (hence the tagline. Don't be misled; it's actually very friendly), so the entire grid system can be customized and tweaked just by changing a few variables.
</p>


<h3>Tips and Tricks</h3>
<p>
I learned a great deal about grid-based design and CSS media queries writing Cheeky, and I wanted to pass on a neat Sass trick I just discovered. For example, I use a mixin called <code>width</code> when defining spans, which takes in an integer and uses it to calculate the correct width. I had written a bunch of code that looked like this:
</p>

<pre>
.span-1  { @include width(1); }
.span-2  { @include width(2); }
.span-3  { @include width(3); }
.span-4  { @include width(4); }
.span-5  { @include width(5); }
<span class="comment">/*...on and on, up to 16 */</span>
</pre>

<p>
This went on and on for spans and offsets in all of the various media queries, creating a ton of repetitive code. Then I discovered that it's a perfect candidate for refactoring using a Sass loop, which reduces the example above to something like this: 
</p>

<pre>
@for $i from 1 to 17 {
  .span-#{$i} { @include width($i); }
}
</pre>

<p>
That by itself generates the code for 16 classes (it doesn't include the endpoint) including the proper mixin! Turns out that <code>for</code> is only one of the Sass control directives; <code>if</code>, <code>each</code>, and <code>while</code> are also included. I don't have too much experience with them yet, but you can read more about them <a href="http://thesassway.com/intermediate/if-for-each-while">here</a>.
</p>


<h3>Why?</h3>
<p>
With a large number of grid systems already available, one might ask why bother writing another one. Cheeky was created entirely as a learning exercise to practice responsive design techniques, and derives much inspiration from the excellent Twitter <a href="http://github.com/twitter/bootstrap">Bootstrap</a> project. I'm using Cheeky in production on this site (resize this window!) and several other projects, and it's held up to the task. If you'd like to read more about Cheeky, I've set up a more extensive info page <a href="http://andrewberls.github.com/Cheeky/">here</a>, and the project is hosted on GitHub <a href="http://github.com/andrewberls/Cheeky">here</a>. Finally, if you use Cheeky in any of your projects be sure to let me know on <a href="http://twitter.com/aberls">Twitter</a>!
</p>
}


User.create(
  email: "user@gmail.com",
  password: "password",
  full_name: "Test User",
  permissions: 0
)

Post.create(
  title: "Reducing bad signup emails with mailcheck.js", 
  body: POST_MAILCHECK, 
  status: 1, 
  url_alias: "reducing-bad-signup-emails-with-mailcheck-js", 
  user_id: 1
)

Post.create(
  title: "Introducing Cheeky: The responsive grid with Sass", 
  body: POST_CHEEKY, 
  status: 1, 
  url_alias: "introducing-cheeky-the-responsive-grid-with-sass", 
  user_id: 1
)