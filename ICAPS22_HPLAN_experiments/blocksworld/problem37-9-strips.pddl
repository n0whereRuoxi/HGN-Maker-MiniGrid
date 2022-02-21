( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b717 - block
    b15 - block
    b130 - block
    b819 - block
    b370 - block
    b821 - block
    b519 - block
    b828 - block
    b960 - block
    b751 - block
    b796 - block
    b595 - block
    b55 - block
    b111 - block
    b256 - block
    b897 - block
    b125 - block
    b396 - block
    b126 - block
    b904 - block
    b497 - block
    b644 - block
    b561 - block
    b918 - block
    b43 - block
    b122 - block
    b139 - block
    b25 - block
    b177 - block
    b799 - block
    b754 - block
    b646 - block
    b67 - block
    b499 - block
    b180 - block
    b217 - block
    b292 - block
    b520 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b717 )
    ( on b15 b717 )
    ( on b130 b15 )
    ( on b819 b130 )
    ( on b370 b819 )
    ( on b821 b370 )
    ( on b519 b821 )
    ( on b828 b519 )
    ( on b960 b828 )
    ( on b751 b960 )
    ( on b796 b751 )
    ( on b595 b796 )
    ( on b55 b595 )
    ( on b111 b55 )
    ( on b256 b111 )
    ( on b897 b256 )
    ( on b125 b897 )
    ( on b396 b125 )
    ( on b126 b396 )
    ( on b904 b126 )
    ( on b497 b904 )
    ( on b644 b497 )
    ( on b561 b644 )
    ( on b918 b561 )
    ( on b43 b918 )
    ( on b122 b43 )
    ( on b139 b122 )
    ( on b25 b139 )
    ( on b177 b25 )
    ( on b799 b177 )
    ( on b754 b799 )
    ( on b646 b754 )
    ( on b67 b646 )
    ( on b499 b67 )
    ( on b180 b499 )
    ( on b217 b180 )
    ( on b292 b217 )
    ( on b520 b292 )
    ( clear b520 )
  )
  ( :goal
    ( and
      ( clear b717 )
    )
  )
)
