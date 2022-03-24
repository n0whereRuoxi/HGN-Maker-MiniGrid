( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b742 - block
    b130 - block
    b330 - block
    b33 - block
    b702 - block
    b83 - block
    b275 - block
    b48 - block
    b750 - block
    b545 - block
    b623 - block
    b208 - block
    b17 - block
    b75 - block
    b907 - block
    b693 - block
    b97 - block
    b828 - block
    b145 - block
    b191 - block
    b559 - block
    b23 - block
    b260 - block
    b268 - block
    b697 - block
    b202 - block
    b500 - block
    b591 - block
    b147 - block
    b531 - block
    b139 - block
    b158 - block
    b575 - block
    b948 - block
    b883 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b742 )
    ( on b130 b742 )
    ( on b330 b130 )
    ( on b33 b330 )
    ( on b702 b33 )
    ( on b83 b702 )
    ( on b275 b83 )
    ( on b48 b275 )
    ( on b750 b48 )
    ( on b545 b750 )
    ( on b623 b545 )
    ( on b208 b623 )
    ( on b17 b208 )
    ( on b75 b17 )
    ( on b907 b75 )
    ( on b693 b907 )
    ( on b97 b693 )
    ( on b828 b97 )
    ( on b145 b828 )
    ( on b191 b145 )
    ( on b559 b191 )
    ( on b23 b559 )
    ( on b260 b23 )
    ( on b268 b260 )
    ( on b697 b268 )
    ( on b202 b697 )
    ( on b500 b202 )
    ( on b591 b500 )
    ( on b147 b591 )
    ( on b531 b147 )
    ( on b139 b531 )
    ( on b158 b139 )
    ( on b575 b158 )
    ( on b948 b575 )
    ( on b883 b948 )
    ( clear b883 )
  )
  ( :goal
    ( and
      ( clear b742 )
    )
  )
)
