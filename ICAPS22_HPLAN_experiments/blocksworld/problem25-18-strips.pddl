( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b614 - block
    b378 - block
    b256 - block
    b762 - block
    b966 - block
    b764 - block
    b752 - block
    b21 - block
    b704 - block
    b845 - block
    b177 - block
    b515 - block
    b797 - block
    b284 - block
    b987 - block
    b533 - block
    b395 - block
    b553 - block
    b441 - block
    b333 - block
    b130 - block
    b575 - block
    b423 - block
    b22 - block
    b164 - block
    b347 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b614 )
    ( on b378 b614 )
    ( on b256 b378 )
    ( on b762 b256 )
    ( on b966 b762 )
    ( on b764 b966 )
    ( on b752 b764 )
    ( on b21 b752 )
    ( on b704 b21 )
    ( on b845 b704 )
    ( on b177 b845 )
    ( on b515 b177 )
    ( on b797 b515 )
    ( on b284 b797 )
    ( on b987 b284 )
    ( on b533 b987 )
    ( on b395 b533 )
    ( on b553 b395 )
    ( on b441 b553 )
    ( on b333 b441 )
    ( on b130 b333 )
    ( on b575 b130 )
    ( on b423 b575 )
    ( on b22 b423 )
    ( on b164 b22 )
    ( on b347 b164 )
    ( clear b347 )
  )
  ( :goal
    ( and
      ( clear b614 )
    )
  )
)
