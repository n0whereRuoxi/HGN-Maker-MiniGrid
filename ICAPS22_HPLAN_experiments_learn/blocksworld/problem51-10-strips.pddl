( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b511 - block
    b550 - block
    b320 - block
    b476 - block
    b645 - block
    b978 - block
    b917 - block
    b343 - block
    b623 - block
    b42 - block
    b84 - block
    b625 - block
    b979 - block
    b126 - block
    b419 - block
    b7 - block
    b243 - block
    b580 - block
    b384 - block
    b468 - block
    b203 - block
    b721 - block
    b677 - block
    b197 - block
    b342 - block
    b834 - block
    b633 - block
    b355 - block
    b209 - block
    b680 - block
    b23 - block
    b282 - block
    b927 - block
    b893 - block
    b720 - block
    b463 - block
    b759 - block
    b833 - block
    b861 - block
    b268 - block
    b868 - block
    b423 - block
    b402 - block
    b592 - block
    b555 - block
    b485 - block
    b154 - block
    b64 - block
    b962 - block
    b719 - block
    b632 - block
    b745 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b511 )
    ( on b550 b511 )
    ( on b320 b550 )
    ( on b476 b320 )
    ( on b645 b476 )
    ( on b978 b645 )
    ( on b917 b978 )
    ( on b343 b917 )
    ( on b623 b343 )
    ( on b42 b623 )
    ( on b84 b42 )
    ( on b625 b84 )
    ( on b979 b625 )
    ( on b126 b979 )
    ( on b419 b126 )
    ( on b7 b419 )
    ( on b243 b7 )
    ( on b580 b243 )
    ( on b384 b580 )
    ( on b468 b384 )
    ( on b203 b468 )
    ( on b721 b203 )
    ( on b677 b721 )
    ( on b197 b677 )
    ( on b342 b197 )
    ( on b834 b342 )
    ( on b633 b834 )
    ( on b355 b633 )
    ( on b209 b355 )
    ( on b680 b209 )
    ( on b23 b680 )
    ( on b282 b23 )
    ( on b927 b282 )
    ( on b893 b927 )
    ( on b720 b893 )
    ( on b463 b720 )
    ( on b759 b463 )
    ( on b833 b759 )
    ( on b861 b833 )
    ( on b268 b861 )
    ( on b868 b268 )
    ( on b423 b868 )
    ( on b402 b423 )
    ( on b592 b402 )
    ( on b555 b592 )
    ( on b485 b555 )
    ( on b154 b485 )
    ( on b64 b154 )
    ( on b962 b64 )
    ( on b719 b962 )
    ( on b632 b719 )
    ( on b745 b632 )
    ( clear b745 )
  )
  ( :goal
    ( and
      ( clear b511 )
    )
  )
)
