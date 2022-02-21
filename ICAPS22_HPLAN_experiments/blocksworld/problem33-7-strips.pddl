( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b934 - block
    b23 - block
    b22 - block
    b46 - block
    b947 - block
    b779 - block
    b921 - block
    b524 - block
    b166 - block
    b740 - block
    b741 - block
    b764 - block
    b597 - block
    b756 - block
    b585 - block
    b260 - block
    b906 - block
    b680 - block
    b838 - block
    b3 - block
    b216 - block
    b506 - block
    b977 - block
    b466 - block
    b621 - block
    b798 - block
    b340 - block
    b228 - block
    b235 - block
    b29 - block
    b785 - block
    b936 - block
    b155 - block
    b98 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b934 )
    ( on b23 b934 )
    ( on b22 b23 )
    ( on b46 b22 )
    ( on b947 b46 )
    ( on b779 b947 )
    ( on b921 b779 )
    ( on b524 b921 )
    ( on b166 b524 )
    ( on b740 b166 )
    ( on b741 b740 )
    ( on b764 b741 )
    ( on b597 b764 )
    ( on b756 b597 )
    ( on b585 b756 )
    ( on b260 b585 )
    ( on b906 b260 )
    ( on b680 b906 )
    ( on b838 b680 )
    ( on b3 b838 )
    ( on b216 b3 )
    ( on b506 b216 )
    ( on b977 b506 )
    ( on b466 b977 )
    ( on b621 b466 )
    ( on b798 b621 )
    ( on b340 b798 )
    ( on b228 b340 )
    ( on b235 b228 )
    ( on b29 b235 )
    ( on b785 b29 )
    ( on b936 b785 )
    ( on b155 b936 )
    ( on b98 b155 )
    ( clear b98 )
  )
  ( :goal
    ( and
      ( clear b934 )
    )
  )
)
