( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b755 - block
    b511 - block
    b190 - block
    b69 - block
    b556 - block
    b604 - block
    b983 - block
    b969 - block
    b338 - block
    b975 - block
    b57 - block
    b876 - block
    b460 - block
    b472 - block
    b950 - block
    b962 - block
    b524 - block
    b718 - block
    b445 - block
    b725 - block
    b443 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b755 )
    ( on b511 b755 )
    ( on b190 b511 )
    ( on b69 b190 )
    ( on b556 b69 )
    ( on b604 b556 )
    ( on b983 b604 )
    ( on b969 b983 )
    ( on b338 b969 )
    ( on b975 b338 )
    ( on b57 b975 )
    ( on b876 b57 )
    ( on b460 b876 )
    ( on b472 b460 )
    ( on b950 b472 )
    ( on b962 b950 )
    ( on b524 b962 )
    ( on b718 b524 )
    ( on b445 b718 )
    ( on b725 b445 )
    ( on b443 b725 )
    ( clear b443 )
  )
  ( :tasks
    ( Make-20Pile b511 b190 b69 b556 b604 b983 b969 b338 b975 b57 b876 b460 b472 b950 b962 b524 b718 b445 b725 b443 )
  )
)
