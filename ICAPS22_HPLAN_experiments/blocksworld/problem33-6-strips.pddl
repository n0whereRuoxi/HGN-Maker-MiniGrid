( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b834 - block
    b118 - block
    b321 - block
    b221 - block
    b474 - block
    b884 - block
    b835 - block
    b774 - block
    b733 - block
    b706 - block
    b359 - block
    b157 - block
    b392 - block
    b399 - block
    b327 - block
    b49 - block
    b295 - block
    b794 - block
    b245 - block
    b102 - block
    b567 - block
    b257 - block
    b859 - block
    b487 - block
    b598 - block
    b194 - block
    b747 - block
    b471 - block
    b992 - block
    b715 - block
    b479 - block
    b320 - block
    b93 - block
    b499 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b834 )
    ( on b118 b834 )
    ( on b321 b118 )
    ( on b221 b321 )
    ( on b474 b221 )
    ( on b884 b474 )
    ( on b835 b884 )
    ( on b774 b835 )
    ( on b733 b774 )
    ( on b706 b733 )
    ( on b359 b706 )
    ( on b157 b359 )
    ( on b392 b157 )
    ( on b399 b392 )
    ( on b327 b399 )
    ( on b49 b327 )
    ( on b295 b49 )
    ( on b794 b295 )
    ( on b245 b794 )
    ( on b102 b245 )
    ( on b567 b102 )
    ( on b257 b567 )
    ( on b859 b257 )
    ( on b487 b859 )
    ( on b598 b487 )
    ( on b194 b598 )
    ( on b747 b194 )
    ( on b471 b747 )
    ( on b992 b471 )
    ( on b715 b992 )
    ( on b479 b715 )
    ( on b320 b479 )
    ( on b93 b320 )
    ( on b499 b93 )
    ( clear b499 )
  )
  ( :goal
    ( and
      ( clear b834 )
    )
  )
)
