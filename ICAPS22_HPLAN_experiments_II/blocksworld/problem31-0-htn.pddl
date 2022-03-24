( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b602 - block
    b64 - block
    b566 - block
    b727 - block
    b60 - block
    b660 - block
    b775 - block
    b16 - block
    b758 - block
    b662 - block
    b867 - block
    b246 - block
    b944 - block
    b118 - block
    b268 - block
    b292 - block
    b326 - block
    b747 - block
    b721 - block
    b795 - block
    b670 - block
    b718 - block
    b509 - block
    b348 - block
    b370 - block
    b29 - block
    b525 - block
    b109 - block
    b55 - block
    b382 - block
    b434 - block
    b386 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b602 )
    ( on b64 b602 )
    ( on b566 b64 )
    ( on b727 b566 )
    ( on b60 b727 )
    ( on b660 b60 )
    ( on b775 b660 )
    ( on b16 b775 )
    ( on b758 b16 )
    ( on b662 b758 )
    ( on b867 b662 )
    ( on b246 b867 )
    ( on b944 b246 )
    ( on b118 b944 )
    ( on b268 b118 )
    ( on b292 b268 )
    ( on b326 b292 )
    ( on b747 b326 )
    ( on b721 b747 )
    ( on b795 b721 )
    ( on b670 b795 )
    ( on b718 b670 )
    ( on b509 b718 )
    ( on b348 b509 )
    ( on b370 b348 )
    ( on b29 b370 )
    ( on b525 b29 )
    ( on b109 b525 )
    ( on b55 b109 )
    ( on b382 b55 )
    ( on b434 b382 )
    ( on b386 b434 )
    ( clear b386 )
  )
  ( :tasks
    ( Make-31Pile b64 b566 b727 b60 b660 b775 b16 b758 b662 b867 b246 b944 b118 b268 b292 b326 b747 b721 b795 b670 b718 b509 b348 b370 b29 b525 b109 b55 b382 b434 b386 )
  )
)
