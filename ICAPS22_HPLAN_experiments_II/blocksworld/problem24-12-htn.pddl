( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b255 - block
    b225 - block
    b660 - block
    b686 - block
    b515 - block
    b213 - block
    b567 - block
    b822 - block
    b279 - block
    b625 - block
    b503 - block
    b339 - block
    b681 - block
    b343 - block
    b801 - block
    b89 - block
    b419 - block
    b166 - block
    b393 - block
    b142 - block
    b297 - block
    b751 - block
    b233 - block
    b637 - block
    b948 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b255 )
    ( on b225 b255 )
    ( on b660 b225 )
    ( on b686 b660 )
    ( on b515 b686 )
    ( on b213 b515 )
    ( on b567 b213 )
    ( on b822 b567 )
    ( on b279 b822 )
    ( on b625 b279 )
    ( on b503 b625 )
    ( on b339 b503 )
    ( on b681 b339 )
    ( on b343 b681 )
    ( on b801 b343 )
    ( on b89 b801 )
    ( on b419 b89 )
    ( on b166 b419 )
    ( on b393 b166 )
    ( on b142 b393 )
    ( on b297 b142 )
    ( on b751 b297 )
    ( on b233 b751 )
    ( on b637 b233 )
    ( on b948 b637 )
    ( clear b948 )
  )
  ( :tasks
    ( Make-24Pile b225 b660 b686 b515 b213 b567 b822 b279 b625 b503 b339 b681 b343 b801 b89 b419 b166 b393 b142 b297 b751 b233 b637 b948 )
  )
)
