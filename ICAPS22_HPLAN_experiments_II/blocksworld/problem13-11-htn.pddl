( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b497 - block
    b443 - block
    b87 - block
    b764 - block
    b149 - block
    b507 - block
    b670 - block
    b769 - block
    b945 - block
    b275 - block
    b406 - block
    b554 - block
    b320 - block
    b241 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b497 )
    ( on b443 b497 )
    ( on b87 b443 )
    ( on b764 b87 )
    ( on b149 b764 )
    ( on b507 b149 )
    ( on b670 b507 )
    ( on b769 b670 )
    ( on b945 b769 )
    ( on b275 b945 )
    ( on b406 b275 )
    ( on b554 b406 )
    ( on b320 b554 )
    ( on b241 b320 )
    ( clear b241 )
  )
  ( :tasks
    ( Make-13Pile b443 b87 b764 b149 b507 b670 b769 b945 b275 b406 b554 b320 b241 )
  )
)
