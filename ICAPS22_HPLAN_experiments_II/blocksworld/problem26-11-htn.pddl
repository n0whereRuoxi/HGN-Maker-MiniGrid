( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b378 - block
    b286 - block
    b330 - block
    b116 - block
    b665 - block
    b418 - block
    b119 - block
    b998 - block
    b274 - block
    b999 - block
    b303 - block
    b597 - block
    b294 - block
    b198 - block
    b236 - block
    b40 - block
    b520 - block
    b728 - block
    b554 - block
    b267 - block
    b758 - block
    b672 - block
    b756 - block
    b535 - block
    b769 - block
    b20 - block
    b200 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b378 )
    ( on b286 b378 )
    ( on b330 b286 )
    ( on b116 b330 )
    ( on b665 b116 )
    ( on b418 b665 )
    ( on b119 b418 )
    ( on b998 b119 )
    ( on b274 b998 )
    ( on b999 b274 )
    ( on b303 b999 )
    ( on b597 b303 )
    ( on b294 b597 )
    ( on b198 b294 )
    ( on b236 b198 )
    ( on b40 b236 )
    ( on b520 b40 )
    ( on b728 b520 )
    ( on b554 b728 )
    ( on b267 b554 )
    ( on b758 b267 )
    ( on b672 b758 )
    ( on b756 b672 )
    ( on b535 b756 )
    ( on b769 b535 )
    ( on b20 b769 )
    ( on b200 b20 )
    ( clear b200 )
  )
  ( :tasks
    ( Make-26Pile b286 b330 b116 b665 b418 b119 b998 b274 b999 b303 b597 b294 b198 b236 b40 b520 b728 b554 b267 b758 b672 b756 b535 b769 b20 b200 )
  )
)
