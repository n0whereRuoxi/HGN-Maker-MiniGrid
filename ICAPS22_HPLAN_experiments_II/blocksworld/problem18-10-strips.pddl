( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b656 - block
    b807 - block
    b484 - block
    b239 - block
    b596 - block
    b499 - block
    b746 - block
    b677 - block
    b706 - block
    b315 - block
    b950 - block
    b192 - block
    b814 - block
    b545 - block
    b663 - block
    b164 - block
    b270 - block
    b775 - block
    b311 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b656 )
    ( on b807 b656 )
    ( on b484 b807 )
    ( on b239 b484 )
    ( on b596 b239 )
    ( on b499 b596 )
    ( on b746 b499 )
    ( on b677 b746 )
    ( on b706 b677 )
    ( on b315 b706 )
    ( on b950 b315 )
    ( on b192 b950 )
    ( on b814 b192 )
    ( on b545 b814 )
    ( on b663 b545 )
    ( on b164 b663 )
    ( on b270 b164 )
    ( on b775 b270 )
    ( on b311 b775 )
    ( clear b311 )
  )
  ( :goal
    ( and
      ( clear b656 )
    )
  )
)
