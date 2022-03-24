( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b236 - block
    b796 - block
    b866 - block
    b448 - block
    b548 - block
    b999 - block
    b374 - block
    b359 - block
    b372 - block
    b895 - block
    b975 - block
    b697 - block
    b600 - block
    b746 - block
    b354 - block
    b681 - block
    b247 - block
    b463 - block
    b223 - block
    b154 - block
    b676 - block
    b294 - block
    b862 - block
    b356 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b236 )
    ( on b796 b236 )
    ( on b866 b796 )
    ( on b448 b866 )
    ( on b548 b448 )
    ( on b999 b548 )
    ( on b374 b999 )
    ( on b359 b374 )
    ( on b372 b359 )
    ( on b895 b372 )
    ( on b975 b895 )
    ( on b697 b975 )
    ( on b600 b697 )
    ( on b746 b600 )
    ( on b354 b746 )
    ( on b681 b354 )
    ( on b247 b681 )
    ( on b463 b247 )
    ( on b223 b463 )
    ( on b154 b223 )
    ( on b676 b154 )
    ( on b294 b676 )
    ( on b862 b294 )
    ( on b356 b862 )
    ( clear b356 )
  )
  ( :tasks
    ( Make-23Pile b796 b866 b448 b548 b999 b374 b359 b372 b895 b975 b697 b600 b746 b354 b681 b247 b463 b223 b154 b676 b294 b862 b356 )
  )
)
