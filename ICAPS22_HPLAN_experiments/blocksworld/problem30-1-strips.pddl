( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b454 - block
    b294 - block
    b64 - block
    b401 - block
    b925 - block
    b942 - block
    b367 - block
    b645 - block
    b105 - block
    b807 - block
    b920 - block
    b460 - block
    b654 - block
    b450 - block
    b340 - block
    b244 - block
    b61 - block
    b632 - block
    b102 - block
    b513 - block
    b74 - block
    b114 - block
    b110 - block
    b473 - block
    b943 - block
    b459 - block
    b196 - block
    b57 - block
    b898 - block
    b586 - block
    b491 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b454 )
    ( on b294 b454 )
    ( on b64 b294 )
    ( on b401 b64 )
    ( on b925 b401 )
    ( on b942 b925 )
    ( on b367 b942 )
    ( on b645 b367 )
    ( on b105 b645 )
    ( on b807 b105 )
    ( on b920 b807 )
    ( on b460 b920 )
    ( on b654 b460 )
    ( on b450 b654 )
    ( on b340 b450 )
    ( on b244 b340 )
    ( on b61 b244 )
    ( on b632 b61 )
    ( on b102 b632 )
    ( on b513 b102 )
    ( on b74 b513 )
    ( on b114 b74 )
    ( on b110 b114 )
    ( on b473 b110 )
    ( on b943 b473 )
    ( on b459 b943 )
    ( on b196 b459 )
    ( on b57 b196 )
    ( on b898 b57 )
    ( on b586 b898 )
    ( on b491 b586 )
    ( clear b491 )
  )
  ( :goal
    ( and
      ( clear b454 )
    )
  )
)
