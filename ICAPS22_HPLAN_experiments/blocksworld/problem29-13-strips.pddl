( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b628 - block
    b616 - block
    b527 - block
    b954 - block
    b727 - block
    b988 - block
    b45 - block
    b377 - block
    b715 - block
    b21 - block
    b356 - block
    b496 - block
    b241 - block
    b195 - block
    b93 - block
    b764 - block
    b180 - block
    b297 - block
    b42 - block
    b108 - block
    b824 - block
    b713 - block
    b438 - block
    b149 - block
    b997 - block
    b168 - block
    b585 - block
    b411 - block
    b857 - block
    b389 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b628 )
    ( on b616 b628 )
    ( on b527 b616 )
    ( on b954 b527 )
    ( on b727 b954 )
    ( on b988 b727 )
    ( on b45 b988 )
    ( on b377 b45 )
    ( on b715 b377 )
    ( on b21 b715 )
    ( on b356 b21 )
    ( on b496 b356 )
    ( on b241 b496 )
    ( on b195 b241 )
    ( on b93 b195 )
    ( on b764 b93 )
    ( on b180 b764 )
    ( on b297 b180 )
    ( on b42 b297 )
    ( on b108 b42 )
    ( on b824 b108 )
    ( on b713 b824 )
    ( on b438 b713 )
    ( on b149 b438 )
    ( on b997 b149 )
    ( on b168 b997 )
    ( on b585 b168 )
    ( on b411 b585 )
    ( on b857 b411 )
    ( on b389 b857 )
    ( clear b389 )
  )
  ( :goal
    ( and
      ( clear b628 )
    )
  )
)
