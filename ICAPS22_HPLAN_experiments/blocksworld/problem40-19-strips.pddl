( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b981 - block
    b798 - block
    b707 - block
    b584 - block
    b258 - block
    b967 - block
    b593 - block
    b416 - block
    b664 - block
    b147 - block
    b688 - block
    b500 - block
    b467 - block
    b985 - block
    b961 - block
    b678 - block
    b986 - block
    b547 - block
    b379 - block
    b107 - block
    b220 - block
    b674 - block
    b18 - block
    b24 - block
    b48 - block
    b230 - block
    b813 - block
    b816 - block
    b2 - block
    b579 - block
    b959 - block
    b367 - block
    b329 - block
    b63 - block
    b834 - block
    b868 - block
    b280 - block
    b56 - block
    b633 - block
    b346 - block
    b213 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b981 )
    ( on b798 b981 )
    ( on b707 b798 )
    ( on b584 b707 )
    ( on b258 b584 )
    ( on b967 b258 )
    ( on b593 b967 )
    ( on b416 b593 )
    ( on b664 b416 )
    ( on b147 b664 )
    ( on b688 b147 )
    ( on b500 b688 )
    ( on b467 b500 )
    ( on b985 b467 )
    ( on b961 b985 )
    ( on b678 b961 )
    ( on b986 b678 )
    ( on b547 b986 )
    ( on b379 b547 )
    ( on b107 b379 )
    ( on b220 b107 )
    ( on b674 b220 )
    ( on b18 b674 )
    ( on b24 b18 )
    ( on b48 b24 )
    ( on b230 b48 )
    ( on b813 b230 )
    ( on b816 b813 )
    ( on b2 b816 )
    ( on b579 b2 )
    ( on b959 b579 )
    ( on b367 b959 )
    ( on b329 b367 )
    ( on b63 b329 )
    ( on b834 b63 )
    ( on b868 b834 )
    ( on b280 b868 )
    ( on b56 b280 )
    ( on b633 b56 )
    ( on b346 b633 )
    ( on b213 b346 )
    ( clear b213 )
  )
  ( :goal
    ( and
      ( clear b981 )
    )
  )
)
