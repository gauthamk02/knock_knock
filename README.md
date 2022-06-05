<h1 class="code-line" data-line-start=0 data-line-end=1 ><a id="KNOCK_KNOCK_0"></a>KNOCK KNOCK</h1>
<p class="has-line-data" data-line-start="1" data-line-end="3">Are you in a new place? Wanna explore or know more about the place? No Worries…<br>
Just Knock Knock to someone</p>
<h3 class="code-line" data-line-start=4 data-line-end=5 ><a id="Features_4"></a>Features</h3>
<ul>
<li class="has-line-data" data-line-start="5" data-line-end="6">Explore whats going on the city</li>
<li class="has-line-data" data-line-start="6" data-line-end="7">Connect with peope who are willing to help you explore the city</li>
<li class="has-line-data" data-line-start="7" data-line-end="8">Explore the ongoing events</li>
<li class="has-line-data" data-line-start="8" data-line-end="10">Connect with new people by donating your time and be an Expert</li>
</ul>
<h2 class="code-line" data-line-start=10 data-line-end=11 ><a id="Tech_Stack_Used_10"></a>Tech Stack Used</h2>
<ul>
<li class="has-line-data" data-line-start="11" data-line-end="12">Flutter</li>
<li class="has-line-data" data-line-start="12" data-line-end="13">CockroachDB</li>
<li class="has-line-data" data-line-start="13" data-line-end="14">Nodejs</li>
<li class="has-line-data" data-line-start="14" data-line-end="16">Express</li>
</ul>
<h2 class="code-line" data-line-start=16 data-line-end=17 ><a id="Project_Structure_16"></a>Project Structure</h2>
<ul>
<li class="has-line-data" data-line-start="17" data-line-end="19">BackEnd<br>
– MVC structured express server</li>
<li class="has-line-data" data-line-start="19" data-line-end="23">FrontEnd<br>
– Flutter based mobile app<br>
– Used Twilio for number verfication</li>
</ul>
<h3 class="code-line" data-line-start=23 data-line-end=24 ><a id="How_to_run_23"></a>How to run</h3>
<p class="has-line-data" data-line-start="24" data-line-end="25">[Prerequisite] - Docker | Android-studio | Flutter</p>
<p class="has-line-data" data-line-start="26" data-line-end="27">BACKEND</p>
<ul>
<li class="has-line-data" data-line-start="27" data-line-end="28">Switch current directory to Backend and run “docker-compose up” to start server []</li>
<li class="has-line-data" data-line-start="28" data-line-end="29">Get credentials from the <code>CoackroazDB</code></li>
<li class="has-line-data" data-line-start="29" data-line-end="31">Set enviroment <code>DATABASE_URL=&quot;CoakroazDB url&quot;</code></li>
</ul>
<p class="has-line-data" data-line-start="31" data-line-end="32">FRONTEND</p>
<ul>
<li class="has-line-data" data-line-start="33" data-line-end="34">For the front end you need to make an account in Twillio, start a SMS authentication and service.</li>
<li class="has-line-data" data-line-start="34" data-line-end="36">Copy the Tokens from Twillio in the format given below into <code>.env</code> file and store it in <code>/FrontEnd folder</code>.</li>
</ul>
<pre><code class="has-line-data" data-line-start="37" data-line-end="41">ACCSID=[ACCOUNT ID]
SERSID=[SERVICE ID]
AUTHTOKEN=[AUTH TOKEN]
</code></pre>
<img src="https://user-images.githubusercontent.com/69245931/172054802-4fb0bb1c-d002-4982-b6ff-1a7e3ca5f772.gif">
