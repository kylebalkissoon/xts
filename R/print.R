#
#   xts: eXtensible time-series 
#
#   Copyright (C) 2008  Jeffrey A. Ryan jeff.a.ryan @ gmail.com
#
#   Contributions from Joshua M. Ulrich
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.


`print.xts` <-
function(x,fmt,...) {
  check.TZ(x)
  if(missing(fmt)) 
    fmt <- indexFormat(x)
  if(is.null(fmt))
    fmt <- TRUE
  
  xx <- coredata(x, fmt)
  if(length(xx) == 0) {
    if(!is.null(dim(x))) {
      p <- structure(vector(storage.mode(xx)), dim = dim(x),
                     dimnames = list(format(index(x)),colnames(x)))
      print(p)
    } else {
      cat('Data:\n')
      print(vector(storage.mode(xx)))
      cat('\n')
      cat('Index:\n')
      index <- index(x)
      if(length(index) == 0) {
        print(index)
      } else {
        str(index(x))
      }
    }
  } else print(xx, ...)
}

