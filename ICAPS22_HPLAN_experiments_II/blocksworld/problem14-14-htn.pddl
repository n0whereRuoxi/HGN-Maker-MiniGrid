( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b670 - block
    b326 - block
    b891 - block
    b518 - block
    b517 - block
    b475 - block
    b910 - block
    b539 - block
    b896 - block
    b472 - block
    b284 - block
    b139 - block
    b378 - block
    b453 - block
    b503 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b670 )
    ( on b326 b670 )
    ( on b891 b326 )
    ( on b518 b891 )
    ( on b517 b518 )
    ( on b475 b517 )
    ( on b910 b475 )
    ( on b539 b910 )
    ( on b896 b539 )
    ( on b472 b896 )
    ( on b284 b472 )
    ( on b139 b284 )
    ( on b378 b139 )
    ( on b453 b378 )
    ( on b503 b453 )
    ( clear b503 )
  )
  ( :tasks
    ( Make-14Pile b326 b891 b518 b517 b475 b910 b539 b896 b472 b284 b139 b378 b453 b503 )
  )
)
