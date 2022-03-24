( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b851 - block
    b734 - block
    b975 - block
    b165 - block
    b143 - block
    b35 - block
    b632 - block
    b134 - block
    b593 - block
    b559 - block
    b130 - block
    b391 - block
    b305 - block
    b576 - block
    b213 - block
    b468 - block
    b70 - block
    b716 - block
    b126 - block
    b893 - block
    b788 - block
    b998 - block
    b168 - block
    b515 - block
    b480 - block
    b606 - block
    b4 - block
    b786 - block
    b24 - block
    b492 - block
    b454 - block
    b717 - block
    b690 - block
    b342 - block
    b424 - block
    b310 - block
    b370 - block
    b113 - block
    b554 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b851 )
    ( on b734 b851 )
    ( on b975 b734 )
    ( on b165 b975 )
    ( on b143 b165 )
    ( on b35 b143 )
    ( on b632 b35 )
    ( on b134 b632 )
    ( on b593 b134 )
    ( on b559 b593 )
    ( on b130 b559 )
    ( on b391 b130 )
    ( on b305 b391 )
    ( on b576 b305 )
    ( on b213 b576 )
    ( on b468 b213 )
    ( on b70 b468 )
    ( on b716 b70 )
    ( on b126 b716 )
    ( on b893 b126 )
    ( on b788 b893 )
    ( on b998 b788 )
    ( on b168 b998 )
    ( on b515 b168 )
    ( on b480 b515 )
    ( on b606 b480 )
    ( on b4 b606 )
    ( on b786 b4 )
    ( on b24 b786 )
    ( on b492 b24 )
    ( on b454 b492 )
    ( on b717 b454 )
    ( on b690 b717 )
    ( on b342 b690 )
    ( on b424 b342 )
    ( on b310 b424 )
    ( on b370 b310 )
    ( on b113 b370 )
    ( on b554 b113 )
    ( clear b554 )
  )
  ( :goal
    ( and
      ( clear b851 )
    )
  )
)
