( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b357 - block
    b9 - block
    b317 - block
    b48 - block
    b913 - block
    b8 - block
    b93 - block
    b570 - block
    b180 - block
    b889 - block
    b359 - block
    b709 - block
    b988 - block
    b782 - block
    b11 - block
    b810 - block
    b540 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b357 )
    ( on b9 b357 )
    ( on b317 b9 )
    ( on b48 b317 )
    ( on b913 b48 )
    ( on b8 b913 )
    ( on b93 b8 )
    ( on b570 b93 )
    ( on b180 b570 )
    ( on b889 b180 )
    ( on b359 b889 )
    ( on b709 b359 )
    ( on b988 b709 )
    ( on b782 b988 )
    ( on b11 b782 )
    ( on b810 b11 )
    ( on b540 b810 )
    ( clear b540 )
  )
  ( :goal
    ( and
      ( clear b357 )
    )
  )
)
