( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b995 - block
    b495 - block
    b223 - block
    b998 - block
    b978 - block
    b538 - block
    b147 - block
    b155 - block
    b162 - block
    b199 - block
    b879 - block
    b447 - block
    b36 - block
    b781 - block
    b293 - block
    b823 - block
    b122 - block
    b508 - block
    b907 - block
    b259 - block
    b839 - block
    b237 - block
    b932 - block
    b789 - block
    b39 - block
    b745 - block
    b396 - block
    b929 - block
    b851 - block
    b333 - block
    b239 - block
    b828 - block
    b540 - block
    b988 - block
    b777 - block
    b174 - block
    b954 - block
    b26 - block
    b644 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b995 )
    ( on b495 b995 )
    ( on b223 b495 )
    ( on b998 b223 )
    ( on b978 b998 )
    ( on b538 b978 )
    ( on b147 b538 )
    ( on b155 b147 )
    ( on b162 b155 )
    ( on b199 b162 )
    ( on b879 b199 )
    ( on b447 b879 )
    ( on b36 b447 )
    ( on b781 b36 )
    ( on b293 b781 )
    ( on b823 b293 )
    ( on b122 b823 )
    ( on b508 b122 )
    ( on b907 b508 )
    ( on b259 b907 )
    ( on b839 b259 )
    ( on b237 b839 )
    ( on b932 b237 )
    ( on b789 b932 )
    ( on b39 b789 )
    ( on b745 b39 )
    ( on b396 b745 )
    ( on b929 b396 )
    ( on b851 b929 )
    ( on b333 b851 )
    ( on b239 b333 )
    ( on b828 b239 )
    ( on b540 b828 )
    ( on b988 b540 )
    ( on b777 b988 )
    ( on b174 b777 )
    ( on b954 b174 )
    ( on b26 b954 )
    ( on b644 b26 )
    ( clear b644 )
  )
  ( :goal
    ( and
      ( clear b995 )
    )
  )
)
