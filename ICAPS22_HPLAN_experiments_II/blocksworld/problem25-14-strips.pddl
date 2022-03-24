( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b194 - block
    b757 - block
    b299 - block
    b961 - block
    b467 - block
    b606 - block
    b228 - block
    b647 - block
    b89 - block
    b719 - block
    b257 - block
    b742 - block
    b69 - block
    b724 - block
    b329 - block
    b256 - block
    b975 - block
    b860 - block
    b122 - block
    b130 - block
    b997 - block
    b879 - block
    b582 - block
    b279 - block
    b19 - block
    b447 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b194 )
    ( on b757 b194 )
    ( on b299 b757 )
    ( on b961 b299 )
    ( on b467 b961 )
    ( on b606 b467 )
    ( on b228 b606 )
    ( on b647 b228 )
    ( on b89 b647 )
    ( on b719 b89 )
    ( on b257 b719 )
    ( on b742 b257 )
    ( on b69 b742 )
    ( on b724 b69 )
    ( on b329 b724 )
    ( on b256 b329 )
    ( on b975 b256 )
    ( on b860 b975 )
    ( on b122 b860 )
    ( on b130 b122 )
    ( on b997 b130 )
    ( on b879 b997 )
    ( on b582 b879 )
    ( on b279 b582 )
    ( on b19 b279 )
    ( on b447 b19 )
    ( clear b447 )
  )
  ( :goal
    ( and
      ( clear b194 )
    )
  )
)
