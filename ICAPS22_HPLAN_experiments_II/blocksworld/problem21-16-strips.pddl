( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b442 - block
    b415 - block
    b948 - block
    b324 - block
    b310 - block
    b901 - block
    b838 - block
    b75 - block
    b919 - block
    b43 - block
    b514 - block
    b356 - block
    b916 - block
    b863 - block
    b850 - block
    b573 - block
    b355 - block
    b809 - block
    b808 - block
    b332 - block
    b319 - block
    b714 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b442 )
    ( on b415 b442 )
    ( on b948 b415 )
    ( on b324 b948 )
    ( on b310 b324 )
    ( on b901 b310 )
    ( on b838 b901 )
    ( on b75 b838 )
    ( on b919 b75 )
    ( on b43 b919 )
    ( on b514 b43 )
    ( on b356 b514 )
    ( on b916 b356 )
    ( on b863 b916 )
    ( on b850 b863 )
    ( on b573 b850 )
    ( on b355 b573 )
    ( on b809 b355 )
    ( on b808 b809 )
    ( on b332 b808 )
    ( on b319 b332 )
    ( on b714 b319 )
    ( clear b714 )
  )
  ( :goal
    ( and
      ( clear b442 )
    )
  )
)
