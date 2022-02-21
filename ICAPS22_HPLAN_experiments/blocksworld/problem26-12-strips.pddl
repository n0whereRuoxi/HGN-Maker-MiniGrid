( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b579 - block
    b161 - block
    b981 - block
    b696 - block
    b167 - block
    b865 - block
    b907 - block
    b353 - block
    b827 - block
    b730 - block
    b53 - block
    b397 - block
    b880 - block
    b485 - block
    b249 - block
    b583 - block
    b507 - block
    b810 - block
    b339 - block
    b953 - block
    b789 - block
    b915 - block
    b300 - block
    b398 - block
    b380 - block
    b271 - block
    b213 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b579 )
    ( on b161 b579 )
    ( on b981 b161 )
    ( on b696 b981 )
    ( on b167 b696 )
    ( on b865 b167 )
    ( on b907 b865 )
    ( on b353 b907 )
    ( on b827 b353 )
    ( on b730 b827 )
    ( on b53 b730 )
    ( on b397 b53 )
    ( on b880 b397 )
    ( on b485 b880 )
    ( on b249 b485 )
    ( on b583 b249 )
    ( on b507 b583 )
    ( on b810 b507 )
    ( on b339 b810 )
    ( on b953 b339 )
    ( on b789 b953 )
    ( on b915 b789 )
    ( on b300 b915 )
    ( on b398 b300 )
    ( on b380 b398 )
    ( on b271 b380 )
    ( on b213 b271 )
    ( clear b213 )
  )
  ( :goal
    ( and
      ( clear b579 )
    )
  )
)
