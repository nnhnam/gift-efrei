<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300&display=swap" rel="stylesheet">
    <title>MyEfrei For Tutors - Login</title>
</head>
<body>


<nav class="bg-blue-900 border-gray-200 px-2 sm:px-4 py-2.5  dark:bg-gray-900">
    <div class="container flex flex-wrap items-center justify-between mx-auto">
        <a href="" class="flex items-center">
            <img src="data:image/png;base64,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"
                 class="h-12 mr-6 sm:h-12" alt="Flowbite Logo" />
        </a>
        <button data-collapse-toggle="navbar-default" type="button" class="inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-white dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="navbar-default" aria-expanded="false">
            <span class="sr-only">Open main menu</span>
            <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path></svg>
        </button>
        <div class="hidden w-full md:block md:w-auto" id="navbar-default">
            <ul class="flex flex-col p-4 mt-4 border border-gray-100 rounded-lg bg-blue-900 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-blue-900 dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700 items-center  ">
                <li>
                    <a href="#" class="block py-2 pl-3 pr-4 text-white bg-blue-700 rounded md:bg-transparent md:p-0 dark:text-white">Login</a>
                </li>

                <li>
                    <div href="#" class="block py-2 pl-3 pr-4 text-white rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">
                        <button id="theme-toggle" type="button" class="text-white dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-2.5">
                            <svg id="theme-toggle-dark-icon" class="hidden w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"></path></svg>
                            <svg id="theme-toggle-light-icon" class="hidden w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
                        </button>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="bg-white dark:bg-gray-900">
    <div class="flex justify-center h-screen">
        <div class="bg-cover lg:block lg:w-2/3"  style="background-image: url(https://www.myefrei.fr/portal/static/media/public-background.c84f836552a13889abde.jpg)">
            <div class="flex items-center h-full p-20 bg-gray-900 bg-opacity-40">
                <div>
                    <h2 class="text-4xl font-bold text-white">MyEfrei For Tutors.</h2>

                    <p class="max-w-xl mt-3 text-gray-300">Track the milestones of your students easily during their internship.</p>
                </div>
            </div>
        </div>

        <div class="flex items-center w-full max-w-md px-6 mx-auto lg:w-2/6 ">
            <div class="flex-1">
                <div class="text-center">
                    <a href="" class="flex items-center justify-center">
                        <img src="data:image/png;base64,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"
                             class="h-12 mr-6 sm:h-12" alt="Flowbite Logo" />
                    </a>

                    <p class="mt-3 text-gray-500 dark:text-gray-300">Sign in to access your account</p>
                </div>

                <div class="mt-8">
                    <fieldset>
                        <form name='myForm' action='login' method="post">
                            <label for="idLoginField" class="block mb-2 text-sm text-gray-600 dark:text-gray-200">
                                Username
                                <input type='text' name='loginField' id="idLoginField" placeholder='Username'  class="block w-full px-4 py-2 mt-2 text-gray-700 placeholder-gray-400 bg-white border border-gray-200 rounded-md dark:placeholder-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-700 focus:border-blue-400 dark:focus:border-blue-400 focus:ring-blue-400 focus:outline-none focus:ring focus:ring-opacity-40">
                            </label>
                            <br/>
                            <label for="idPwdField"  class="block mb-2 text-sm text-gray-600 dark:text-gray-200">
                                Password
                                <input type='password' name='pwdField' id="idPwdField" placeholder='Password' class="block w-full px-4 py-2 mt-2 text-gray-700 placeholder-gray-400 bg-white border border-gray-200 rounded-md dark:placeholder-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-700 focus:border-blue-400 dark:focus:border-blue-400 focus:ring-blue-400 focus:outline-none focus:ring focus:ring-opacity-40">
                            </label>
                            <br/>
                            <input type='submit' name='action' value='Sign In'  class="w-full px-4 py-2 tracking-wide text-white transition-colors duration-200 transform bg-blue-900 rounded-md hover:bg-blue-400 focus:outline-none focus:bg-blue-400 focus:ring focus:ring-blue-300 focus:ring-opacity-50">
                        </form>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
<script>
    tailwind.config = {
        darkMode: 'class',
        // ...
    }
</script>

<script>
    // On page load or when changing themes, best to add inline in `head` to avoid FOUC
    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        document.documentElement.classList.add('dark');
    } else {
        document.documentElement.classList.remove('dark')
    }


    var themeToggleDarkIcon = document.getElementById('theme-toggle-dark-icon');
    var themeToggleLightIcon = document.getElementById('theme-toggle-light-icon');

    // Change the icons inside the button based on previous settings
    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        themeToggleLightIcon.classList.remove('hidden');
    } else {
        themeToggleDarkIcon.classList.remove('hidden');
    }

    var themeToggleBtn = document.getElementById('theme-toggle');

    themeToggleBtn.addEventListener('click', function() {

        // toggle icons inside button
        themeToggleDarkIcon.classList.toggle('hidden');
        themeToggleLightIcon.classList.toggle('hidden');

        // if set via local storage previously
        if (localStorage.getItem('color-theme')) {
            if (localStorage.getItem('color-theme') === 'light') {
                document.documentElement.classList.add('dark');
                localStorage.setItem('color-theme', 'dark');
            } else {
                document.documentElement.classList.remove('dark');
                localStorage.setItem('color-theme', 'light');
            }

            // if NOT set via local storage previously
        } else {
            if (document.documentElement.classList.contains('dark')) {
                document.documentElement.classList.remove('dark');
                localStorage.setItem('color-theme', 'light');
            } else {
                document.documentElement.classList.add('dark');
                localStorage.setItem('color-theme', 'dark');
            }
        }

    });
</script>
<style>
    *{
        font-family: 'Raleway', sans-serif;
    }
</style>
</body>
</html>