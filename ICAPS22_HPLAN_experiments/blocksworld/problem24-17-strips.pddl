( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b122 - block
    b619 - block
    b87 - block
    b703 - block
    b634 - block
    b822 - block
    b2 - block
    b508 - block
    b793 - block
    b24 - block
    b491 - block
    b579 - block
    b254 - block
    b216 - block
    b165 - block
    b25 - block
    b588 - block
    b933 - block
    b954 - block
    b559 - block
    b397 - block
    b594 - block
    b294 - block
    b951 - block
    b906 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b122 )
    ( on b619 b122 )
    ( on b87 b619 )
    ( on b703 b87 )
    ( on b634 b703 )
    ( on b822 b634 )
    ( on b2 b822 )
    ( on b508 b2 )
    ( on b793 b508 )
    ( on b24 b793 )
    ( on b491 b24 )
    ( on b579 b491 )
    ( on b254 b579 )
    ( on b216 b254 )
    ( on b165 b216 )
    ( on b25 b165 )
    ( on b588 b25 )
    ( on b933 b588 )
    ( on b954 b933 )
    ( on b559 b954 )
    ( on b397 b559 )
    ( on b594 b397 )
    ( on b294 b594 )
    ( on b951 b294 )
    ( on b906 b951 )
    ( clear b906 )
  )
  ( :goal
    ( and
      ( clear b122 )
    )
  )
)
