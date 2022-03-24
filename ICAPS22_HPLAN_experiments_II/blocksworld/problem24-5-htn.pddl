( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b887 - block
    b906 - block
    b397 - block
    b348 - block
    b889 - block
    b372 - block
    b376 - block
    b685 - block
    b622 - block
    b464 - block
    b894 - block
    b304 - block
    b579 - block
    b747 - block
    b977 - block
    b483 - block
    b14 - block
    b508 - block
    b242 - block
    b541 - block
    b238 - block
    b515 - block
    b216 - block
    b785 - block
    b303 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b887 )
    ( on b906 b887 )
    ( on b397 b906 )
    ( on b348 b397 )
    ( on b889 b348 )
    ( on b372 b889 )
    ( on b376 b372 )
    ( on b685 b376 )
    ( on b622 b685 )
    ( on b464 b622 )
    ( on b894 b464 )
    ( on b304 b894 )
    ( on b579 b304 )
    ( on b747 b579 )
    ( on b977 b747 )
    ( on b483 b977 )
    ( on b14 b483 )
    ( on b508 b14 )
    ( on b242 b508 )
    ( on b541 b242 )
    ( on b238 b541 )
    ( on b515 b238 )
    ( on b216 b515 )
    ( on b785 b216 )
    ( on b303 b785 )
    ( clear b303 )
  )
  ( :tasks
    ( Make-24Pile b906 b397 b348 b889 b372 b376 b685 b622 b464 b894 b304 b579 b747 b977 b483 b14 b508 b242 b541 b238 b515 b216 b785 b303 )
  )
)
