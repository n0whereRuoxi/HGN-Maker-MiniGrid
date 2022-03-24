( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b636 - block
    b697 - block
    b526 - block
    b511 - block
    b734 - block
    b758 - block
    b307 - block
    b471 - block
    b23 - block
    b689 - block
    b325 - block
    b132 - block
    b360 - block
    b575 - block
    b542 - block
    b937 - block
    b87 - block
    b552 - block
    b980 - block
    b443 - block
    b167 - block
    b742 - block
    b453 - block
    b401 - block
    b222 - block
    b915 - block
    b446 - block
    b142 - block
    b955 - block
    b260 - block
    b313 - block
    b883 - block
    b262 - block
    b889 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b636 )
    ( on b697 b636 )
    ( on b526 b697 )
    ( on b511 b526 )
    ( on b734 b511 )
    ( on b758 b734 )
    ( on b307 b758 )
    ( on b471 b307 )
    ( on b23 b471 )
    ( on b689 b23 )
    ( on b325 b689 )
    ( on b132 b325 )
    ( on b360 b132 )
    ( on b575 b360 )
    ( on b542 b575 )
    ( on b937 b542 )
    ( on b87 b937 )
    ( on b552 b87 )
    ( on b980 b552 )
    ( on b443 b980 )
    ( on b167 b443 )
    ( on b742 b167 )
    ( on b453 b742 )
    ( on b401 b453 )
    ( on b222 b401 )
    ( on b915 b222 )
    ( on b446 b915 )
    ( on b142 b446 )
    ( on b955 b142 )
    ( on b260 b955 )
    ( on b313 b260 )
    ( on b883 b313 )
    ( on b262 b883 )
    ( on b889 b262 )
    ( clear b889 )
  )
  ( :tasks
    ( Make-33Pile b697 b526 b511 b734 b758 b307 b471 b23 b689 b325 b132 b360 b575 b542 b937 b87 b552 b980 b443 b167 b742 b453 b401 b222 b915 b446 b142 b955 b260 b313 b883 b262 b889 )
  )
)
