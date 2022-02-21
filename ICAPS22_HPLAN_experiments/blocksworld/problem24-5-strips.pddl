( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b534 - block
    b477 - block
    b446 - block
    b304 - block
    b575 - block
    b515 - block
    b841 - block
    b527 - block
    b5 - block
    b764 - block
    b975 - block
    b177 - block
    b546 - block
    b850 - block
    b634 - block
    b626 - block
    b567 - block
    b968 - block
    b817 - block
    b357 - block
    b380 - block
    b280 - block
    b677 - block
    b366 - block
    b747 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b534 )
    ( on b477 b534 )
    ( on b446 b477 )
    ( on b304 b446 )
    ( on b575 b304 )
    ( on b515 b575 )
    ( on b841 b515 )
    ( on b527 b841 )
    ( on b5 b527 )
    ( on b764 b5 )
    ( on b975 b764 )
    ( on b177 b975 )
    ( on b546 b177 )
    ( on b850 b546 )
    ( on b634 b850 )
    ( on b626 b634 )
    ( on b567 b626 )
    ( on b968 b567 )
    ( on b817 b968 )
    ( on b357 b817 )
    ( on b380 b357 )
    ( on b280 b380 )
    ( on b677 b280 )
    ( on b366 b677 )
    ( on b747 b366 )
    ( clear b747 )
  )
  ( :goal
    ( and
      ( clear b534 )
    )
  )
)
