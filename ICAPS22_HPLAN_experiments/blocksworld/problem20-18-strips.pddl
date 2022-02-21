( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b45 - block
    b4 - block
    b294 - block
    b230 - block
    b102 - block
    b976 - block
    b638 - block
    b591 - block
    b292 - block
    b171 - block
    b931 - block
    b188 - block
    b192 - block
    b794 - block
    b824 - block
    b649 - block
    b218 - block
    b757 - block
    b427 - block
    b316 - block
    b884 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b45 )
    ( on b4 b45 )
    ( on b294 b4 )
    ( on b230 b294 )
    ( on b102 b230 )
    ( on b976 b102 )
    ( on b638 b976 )
    ( on b591 b638 )
    ( on b292 b591 )
    ( on b171 b292 )
    ( on b931 b171 )
    ( on b188 b931 )
    ( on b192 b188 )
    ( on b794 b192 )
    ( on b824 b794 )
    ( on b649 b824 )
    ( on b218 b649 )
    ( on b757 b218 )
    ( on b427 b757 )
    ( on b316 b427 )
    ( on b884 b316 )
    ( clear b884 )
  )
  ( :goal
    ( and
      ( clear b45 )
    )
  )
)
