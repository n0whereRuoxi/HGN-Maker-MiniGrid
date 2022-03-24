( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b619 - block
    b276 - block
    b784 - block
    b105 - block
    b171 - block
    b768 - block
    b690 - block
    b148 - block
    b541 - block
    b727 - block
    b11 - block
    b900 - block
    b431 - block
    b356 - block
    b203 - block
    b322 - block
    b405 - block
    b301 - block
    b127 - block
    b682 - block
    b191 - block
    b994 - block
    b33 - block
    b939 - block
    b176 - block
    b426 - block
    b38 - block
    b155 - block
    b952 - block
    b359 - block
    b957 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b619 )
    ( on b276 b619 )
    ( on b784 b276 )
    ( on b105 b784 )
    ( on b171 b105 )
    ( on b768 b171 )
    ( on b690 b768 )
    ( on b148 b690 )
    ( on b541 b148 )
    ( on b727 b541 )
    ( on b11 b727 )
    ( on b900 b11 )
    ( on b431 b900 )
    ( on b356 b431 )
    ( on b203 b356 )
    ( on b322 b203 )
    ( on b405 b322 )
    ( on b301 b405 )
    ( on b127 b301 )
    ( on b682 b127 )
    ( on b191 b682 )
    ( on b994 b191 )
    ( on b33 b994 )
    ( on b939 b33 )
    ( on b176 b939 )
    ( on b426 b176 )
    ( on b38 b426 )
    ( on b155 b38 )
    ( on b952 b155 )
    ( on b359 b952 )
    ( on b957 b359 )
    ( clear b957 )
  )
  ( :goal
    ( and
      ( clear b619 )
    )
  )
)
