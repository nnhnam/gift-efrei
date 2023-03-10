<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<nav class="bg-blue-900 border-gray-200 px-2 sm:px-4 py-2.5  dark:bg-gray-900">
  <div class="container flex flex-wrap items-center justify-between mx-auto">
    <a href="" class="flex items-center">
      <img src="data:image/png;base64,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"
           class="h-12 mr-6 sm:h-12" alt="Flowbite Logo" />
    </a>
    <button data-collapse-toggle="navbar-default" type="button" class="inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg md:hidden  focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="navbar-default" aria-expanded="false">
      <span class="sr-only">Open main menu</span>
      <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path></svg>
    </button>
    <div class="hidden w-full md:block md:w-auto" id="navbar-default">
      <form name='myForm' action='login' method="post">
          <ul class="flex flex-col p-4 mt-4 border border-gray-100 rounded-lg bg-blue-900  md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700 items-center  ">
            <li>
              <a href="${pageContext.request.contextPath}/interns-list" class="block py-2 pl-3 pr-4 text-white rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-400 md:p-0 dark:text-white md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Home</a>
            </li>

            <li>
              <input type="hidden" name="logout" id="logout" value="Logout">
              <input type='submit' name='action' value='Log Out' class="block py-2 pl-3 pr-4 text-white text-white bg-blue-700 rounded md:bg-transparent  md:p-0 dark:text-white">
            </li>

            <li>
              <div href="#" class="block py-2 pl-3 pr-4 text-white rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">
                <button id="theme-toggle" type="button" class="text-white dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-2.5">
                  <svg id="theme-toggle-dark-icon" class="hidden w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"></path></svg>
                  <svg id="theme-toggle-light-icon" class="hidden w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
                </button>
              </div>
            </li>
            <li>
              <div class="relative inline-flex items-center justify-center p-0.5 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-purple-600 to-blue-500 group-hover:from-purple-600 group-hover:to-blue-500 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-blue-300 dark:focus:ring-blue-800">
                  <span class="relative px-5 py-2.5 transition-all ease-in duration-75 bg-blue-900 text-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0">
                      ${sessionScope.supervisor.firstName} ${sessionScope.supervisor.lastName}
                  </span>
              </div>
            </li>
          </ul>
        </form>
    </div>
  </div>
</nav>