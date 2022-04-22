( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b871 - block
    b291 - block
    b487 - block
    b300 - block
    b611 - block
    b784 - block
    b67 - block
    b199 - block
    b757 - block
    b915 - block
    b741 - block
    b710 - block
    b888 - block
    b399 - block
    b684 - block
    b224 - block
    b168 - block
    b17 - block
    b675 - block
    b253 - block
    b792 - block
    b651 - block
    b642 - block
    b423 - block
    b204 - block
    b789 - block
    b633 - block
    b288 - block
    b463 - block
    b546 - block
    b734 - block
    b773 - block
    b811 - block
    b429 - block
    b188 - block
    b735 - block
    b688 - block
    b163 - block
    b983 - block
    b245 - block
    b800 - block
    b705 - block
    b114 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b871 )
    ( on b291 b871 )
    ( on b487 b291 )
    ( on b300 b487 )
    ( on b611 b300 )
    ( on b784 b611 )
    ( on b67 b784 )
    ( on b199 b67 )
    ( on b757 b199 )
    ( on b915 b757 )
    ( on b741 b915 )
    ( on b710 b741 )
    ( on b888 b710 )
    ( on b399 b888 )
    ( on b684 b399 )
    ( on b224 b684 )
    ( on b168 b224 )
    ( on b17 b168 )
    ( on b675 b17 )
    ( on b253 b675 )
    ( on b792 b253 )
    ( on b651 b792 )
    ( on b642 b651 )
    ( on b423 b642 )
    ( on b204 b423 )
    ( on b789 b204 )
    ( on b633 b789 )
    ( on b288 b633 )
    ( on b463 b288 )
    ( on b546 b463 )
    ( on b734 b546 )
    ( on b773 b734 )
    ( on b811 b773 )
    ( on b429 b811 )
    ( on b188 b429 )
    ( on b735 b188 )
    ( on b688 b735 )
    ( on b163 b688 )
    ( on b983 b163 )
    ( on b245 b983 )
    ( on b800 b245 )
    ( on b705 b800 )
    ( on b114 b705 )
    ( clear b114 )
  )
  ( :goal
    ( and
      ( clear b871 )
    )
  )
)
