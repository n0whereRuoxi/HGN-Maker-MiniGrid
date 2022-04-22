( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b633 - block
    b950 - block
    b878 - block
    b44 - block
    b315 - block
    b954 - block
    b45 - block
    b859 - block
    b608 - block
    b276 - block
    b858 - block
    b704 - block
    b613 - block
    b327 - block
    b175 - block
    b645 - block
    b760 - block
    b899 - block
    b881 - block
    b801 - block
    b623 - block
    b511 - block
    b774 - block
    b868 - block
    b416 - block
    b887 - block
    b318 - block
    b578 - block
    b981 - block
    b52 - block
    b375 - block
    b737 - block
    b660 - block
    b551 - block
    b672 - block
    b467 - block
    b118 - block
    b423 - block
    b47 - block
    b616 - block
    b421 - block
    b621 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b633 )
    ( on b950 b633 )
    ( on b878 b950 )
    ( on b44 b878 )
    ( on b315 b44 )
    ( on b954 b315 )
    ( on b45 b954 )
    ( on b859 b45 )
    ( on b608 b859 )
    ( on b276 b608 )
    ( on b858 b276 )
    ( on b704 b858 )
    ( on b613 b704 )
    ( on b327 b613 )
    ( on b175 b327 )
    ( on b645 b175 )
    ( on b760 b645 )
    ( on b899 b760 )
    ( on b881 b899 )
    ( on b801 b881 )
    ( on b623 b801 )
    ( on b511 b623 )
    ( on b774 b511 )
    ( on b868 b774 )
    ( on b416 b868 )
    ( on b887 b416 )
    ( on b318 b887 )
    ( on b578 b318 )
    ( on b981 b578 )
    ( on b52 b981 )
    ( on b375 b52 )
    ( on b737 b375 )
    ( on b660 b737 )
    ( on b551 b660 )
    ( on b672 b551 )
    ( on b467 b672 )
    ( on b118 b467 )
    ( on b423 b118 )
    ( on b47 b423 )
    ( on b616 b47 )
    ( on b421 b616 )
    ( on b621 b421 )
    ( clear b621 )
  )
  ( :goal
    ( and
      ( clear b633 )
    )
  )
)
