( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b105 - block
    b931 - block
    b615 - block
    b411 - block
    b338 - block
    b129 - block
    b419 - block
    b886 - block
    b153 - block
    b456 - block
    b388 - block
    b453 - block
    b902 - block
    b463 - block
    b265 - block
    b738 - block
    b413 - block
    b136 - block
    b298 - block
    b112 - block
    b331 - block
    b27 - block
    b356 - block
    b799 - block
    b807 - block
    b348 - block
    b428 - block
    b316 - block
    b250 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b105 )
    ( on b931 b105 )
    ( on b615 b931 )
    ( on b411 b615 )
    ( on b338 b411 )
    ( on b129 b338 )
    ( on b419 b129 )
    ( on b886 b419 )
    ( on b153 b886 )
    ( on b456 b153 )
    ( on b388 b456 )
    ( on b453 b388 )
    ( on b902 b453 )
    ( on b463 b902 )
    ( on b265 b463 )
    ( on b738 b265 )
    ( on b413 b738 )
    ( on b136 b413 )
    ( on b298 b136 )
    ( on b112 b298 )
    ( on b331 b112 )
    ( on b27 b331 )
    ( on b356 b27 )
    ( on b799 b356 )
    ( on b807 b799 )
    ( on b348 b807 )
    ( on b428 b348 )
    ( on b316 b428 )
    ( on b250 b316 )
    ( clear b250 )
  )
  ( :goal
    ( and
      ( clear b105 )
    )
  )
)
