( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b288 - block
    b293 - block
    b473 - block
    b972 - block
    b487 - block
    b851 - block
    b731 - block
    b923 - block
    b45 - block
    b115 - block
    b353 - block
    b244 - block
    b999 - block
    b177 - block
    b383 - block
    b50 - block
    b974 - block
    b684 - block
    b162 - block
    b814 - block
    b34 - block
    b637 - block
    b829 - block
    b233 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b288 )
    ( on b293 b288 )
    ( on b473 b293 )
    ( on b972 b473 )
    ( on b487 b972 )
    ( on b851 b487 )
    ( on b731 b851 )
    ( on b923 b731 )
    ( on b45 b923 )
    ( on b115 b45 )
    ( on b353 b115 )
    ( on b244 b353 )
    ( on b999 b244 )
    ( on b177 b999 )
    ( on b383 b177 )
    ( on b50 b383 )
    ( on b974 b50 )
    ( on b684 b974 )
    ( on b162 b684 )
    ( on b814 b162 )
    ( on b34 b814 )
    ( on b637 b34 )
    ( on b829 b637 )
    ( on b233 b829 )
    ( clear b233 )
  )
  ( :goal
    ( and
      ( clear b288 )
    )
  )
)
